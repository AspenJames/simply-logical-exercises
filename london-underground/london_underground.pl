/**
 * Simple Prolog knowledge base representing part of the London Underground.
 * Copyright (C) 2022 Aspen James <hello@aspenjames.dev>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

:- module(london_underground, [connected/3,
                               nearby/2,
                               not_too_far/2]).

% connected(StationA, StationB, Line).
% connection(StationA, StationB, Line) creates the inverse connection relation.
connected(A,B,L) :- connection(A,B,L);
                    connection(B,A,L).

% nearby(StationA, StationB).
% Stations are nearby if connected; or on same line and one stop apart.
nearby(A,B) :- connected(A,B,_);
               connected(A,C,L),
               connected(C,B,L).

% not_too_far(StationA, StationB).
% Stations are not too far if connected or one stop apart, regardless of line.
not_too_far(A,B) :- connected(A,B,_);
                    connected(A,C,_),
                    connected(C,B,_).

% London Underground connection data, as per figure.
% connection/3 helper used to succintly map inverse relations.
connection(bond_street, oxford_circus, central).
connection(oxford_circus, tottenham_court_road, central).
connection(bond_street, green_park, jubilee).
connection(green_park, charing_cross, jubilee).
connection(green_park, piccadilly_circus, piccadilly).
connection(piccadilly_circus, leicester_square, piccadilly).
connection(green_park, oxford_circus, victoria).
connection(oxford_circus, piccadilly_circus, bakerloo).
connection(piccadilly_circus, charing_cross, bakerloo).
connection(tottenham_court_road, leicester_square, northern).
connection(leicester_square, charing_cross, northern).
